{ stdenv, buildPythonPackage, fetchPypi
, fftw, pyfftw, numpy, Mako, mpi4py, fluiddyn, psutil, subprocess32, future, matplotlib, pythran, isPy3k, gast }:

buildPythonPackage rec {
  version = "0.1.0";
  pname = "fluidfft";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0w7jdljmaznwabsd86yx3i98aryj1i3mf5rmq2xd9x28ivfskp43";
  };

  buildInputs = [ 
    fftw pyfftw Mako mpi4py fluiddyn psutil future matplotlib pythran gast
  ] ++ stdenv.lib.optional (!isPy3k) subprocess32;

  propagatedBuildInputs = [ numpy ];

  doCheck = false;

  preConfigure = ''
    export LDFLAGS="-L${fftw.out}/lib"
    export CFLAGS="-I${fftw.dev}/include"
  '';

  meta = with stdenv.lib; {
    description = "C++ classes and their Python wrapper classes written in Cython useful to perform Fast Fourier Transform (FFT) with different libraries";
    homepage = "http://fluidfft.readthedocs.io" ;
    license = with licenses; [ cecill ];
    maintainers = with maintainers; [ bzizou ];
  };
}
