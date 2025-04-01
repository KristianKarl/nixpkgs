{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPyPy,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "zope-testing";
  version = "5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope.testing";
    inherit version;
    hash = "sha256-cTXrquw9OHluSRqa2xJ6NlGqDjsgEo3mx3hFH6EazEc=";
  };

  build-system = [ setuptools ];

  doCheck = !isPyPy;

  nativeCheckInputs = [ pytestCheckHook ];

  pytestFlagsArray = [ "src/zope/testing/tests.py" ];

  pythonImportsCheck = [ "zope.testing" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope testing helpers";
    homepage = "https://github.com/zopefoundation/zope.testing";
    changelog = "https://github.com/zopefoundation/zope.testing/blob/${version}/CHANGES.rst";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}
