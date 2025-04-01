{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytest,
}:

buildPythonPackage rec {
  pname = "queuelib";
  version = "1.8.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WCvGVRRIEQCwU5vWcdprNVuHiGnPx32Sxjt1/MnPjic=";
  };

  buildInputs = [ pytest ];

  meta = with lib; {
    description = "Collection of persistent (disk-based) queues for Python";
    homepage = "https://github.com/scrapy/queuelib";
    license = licenses.bsd3;
    maintainers = [ ];
  };
}
