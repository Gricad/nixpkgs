{ stdenv, buildPythonPackage, fetchPypi
 , numpy, psutil, subprocess32, future, matplotlib, isPy3k, h5py, pyfftw, bash }:

buildPythonPackage rec {
  version = "0.1.5";
  pname = "fluiddyn";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "07jzhb1wk5p7m847h3m8k67d075366f2xhl2jlq94ahwwxdcm60l";
  };

  patchPhase = ''
    substituteInPlace fluiddyn/util/query.py --replace "/bin/bash" "${bash}"
    substituteInPlace fluidrtd/ipynb_maker.py --replace "/bin/bash" "${bash}"
  '';

  buildInputs = [ 
    psutil future matplotlib h5py pyfftw
  ] ++ stdenv.lib.optional (!isPy3k) subprocess32 ;

  propagatedBuildInputs = [ numpy ];

  doCheck = false;

  #preCheck = ''
  #  export HOME=$TMPDIR
  #'';

  meta = with stdenv.lib; {
    description = "framework for studying fluid dynamics";
    homepage = "http://fluiddyn.readthedocs.io" ;
    license = with licenses; [ cecill ];
    maintainers = with maintainers; [ bzizou ];
  };
}
