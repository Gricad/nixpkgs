{ stdenv, buildPythonPackage, fetchurl
 , nose , decorator }:

buildPythonPackage rec {
  version = "2.0";
  pname = "networkx";
  name = "${pname}-${version}";

  src = fetchurl {                                             
    url = "mirror://pypi/n/networkx/${name}.zip";
    sha256 = "1ajl2jp8qry9nyjzzkqpy0vmsr14d23z1qk7y0vr5iwjbpvzhpyd";
  };                                                                

  buildInputs = [ nose ];

  propagatedBuildInputs = [ decorator ];

  doCheck = true;

  meta = with stdenv.lib; {
    description = "Library for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks";
    homepage = "https://networkx.github.io/" ;
    license = with licenses; [ bsd3 ];
    maintainers = with maintainers; [ bzizou ];
  };
}
