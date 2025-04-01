{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytest,
  pyvirtualdisplay,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "pytest-xvfb";
  version = "3.1.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kFk2NEJ9l0snLoRXk+RTP1uCfJ2EwFGHkBNiRQQXXkQ=";
  };

  buildInputs = [ pytest ];

  propagatedBuildInputs = [ pyvirtualdisplay ];

  meta = with lib; {
    description = "Pytest plugin to run Xvfb for tests";
    homepage = "https://github.com/The-Compiler/pytest-xvfb";
    changelog = "https://github.com/The-Compiler/pytest-xvfb/blob/v${version}/CHANGELOG.rst";
    license = licenses.mit;
    maintainers = [ ];
  };
}
