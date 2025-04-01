{
  lib,
  buildPythonPackage,
  fetchPypi,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "expiring-dict";
  version = "1.1.2";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yoy4AjBOrlszoj7EwZAZthCt/aUMvEyb+jrVws04djE=";
  };

  propagatedBuildInputs = [ sortedcontainers ];

  pythonImportsCheck = [ "expiring_dict" ];

  meta = with lib; {
    description = "Python dict with TTL support for auto-expiring caches";
    homepage = "https://github.com/dparker2/py-expiring-dict";
    license = licenses.mit;
    maintainers = [ ];
  };
}
