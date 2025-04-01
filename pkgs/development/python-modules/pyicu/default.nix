{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  six,
  icu,
}:

buildPythonPackage rec {
  pname = "pyicu";
  version = "2.15";
  format = "setuptools";

  src = fetchPypi {
    pname = "PyICU";
    inherit version;
    hash = "sha256-JBv05zhRUkr2f+pdlP9gusg92Yzj72/W8sAOB+hHbIc=";
  };

  nativeBuildInputs = [ icu ]; # for icu-config, but should be replaced with pkg-config
  buildInputs = [ icu ];
  nativeCheckInputs = [
    pytestCheckHook
    six
  ];

  pythonImportsCheck = [ "icu" ];

  meta = with lib; {
    homepage = "https://gitlab.pyicu.org/main/pyicu";
    description = "Python extension wrapping the ICU C++ API";
    changelog = "https://gitlab.pyicu.org/main/pyicu/-/raw/v${version}/CHANGES";
    license = licenses.mit;
  };
}
