{ stdenv, buildPythonPackage, fetchPypi
 , astunparse, six }:

buildPythonPackage rec {
  version = "0.1.5";
  pname = "gast";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rwya3vshld1k2qzrcvrxdbkpdyg0yhvy4wia2sipp8ar74f0gsf";
  };

  buildInputs = [ astunparse six ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Python AST that abstracts the underlying Python version";
    homepage = "https://pypi.python.org/pypi/gast" ;
    license = with licenses; [ bsd3 ];
    maintainers = with maintainers; [ bzizou ];
  };
}
