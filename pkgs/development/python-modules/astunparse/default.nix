{ stdenv, buildPythonPackage, fetchPypi
 , six }:

buildPythonPackage rec {
  version = "1.5.0";
  pname = "astunparse";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1kc9lm2jvfcip3z8snj04dar5a9jh857a704m6lvcv4xclm3rpsm";
  };

  buildInputs = [ six ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "An AST unparser for Python";
    homepage = "https://github.com/simonpercivall/astunparse" ;
    license = with licenses; [ bsd3 ];
    maintainers = with maintainers; [ bzizou ];
  };
}
