{ stdenv, buildPythonPackage, fetchPypi
 , numpy, pytestrunner, gast, six, ply, networkx2, pytestpep8, pytest }:

buildPythonPackage rec {
  version = "0.8.3";
  pname = "pythran";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "11l7zb0y1b3y4q591diibsv6aczmg9058w7lpcr20k2rb32lnm8m";
  };

  buildInputs = [ pytestrunner gast six ply networkx2 pytestpep8 pytest ];

  propagateBuildInputs = [ numpy ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "a claimless python to c++ converter";
    homepage = "https://github.com/serge-sans-paille/pythran" ;
    license = with licenses; [ bsd3 ];
    maintainers = with maintainers; [ bzizou ];
  };
}
