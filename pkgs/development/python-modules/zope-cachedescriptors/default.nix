{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "zope-cachedescriptors";
  version = "5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope.cachedescriptors";
    inherit version;
    hash = "sha256-C4bPDC6XtssteBojPB1M80wfxp8/SIqO9z+2GVzv9UA=";
  };

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pytestFlagsArray = [ "src/zope/cachedescriptors/tests.py" ];

  pythonImportsCheck = [ "zope.cachedescriptors" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Method and property caching decorators";
    homepage = "https://github.com/zopefoundation/zope.cachedescriptors";
    changelog = "https://github.com/zopefoundation/zope.cachedescriptors/blob/${version}/CHANGES.rst";
    license = lib.licenses.zpl21;
    maintainers = with lib.maintainers; [ dotlambda ];
  };
}
