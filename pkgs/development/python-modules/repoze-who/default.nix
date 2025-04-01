{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  zope-interface,
  webob,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "repoze-who";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "repoze.who";
    inherit version;
    hash = "sha256-xSimrFqeBp7Vo3UK7zd2IuzlPt0Ah8/AtoXyokwGQnQ=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    zope-interface
    webob
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  # skip failing test
  # OSError: [Errno 22] Invalid argument
  preCheck = ''
    rm repoze/who/plugins/tests/test_htpasswd.py
  '';

  pythonImportsCheck = [ "repoze.who" ];

  pythonNamespaces = [
    "repoze"
    "repoze.who"
    "repoze.who.plugins"
  ];

  meta = with lib; {
    description = "WSGI Authentication Middleware / API";
    homepage = "http://www.repoze.org";
    changelog = "https://github.com/repoze/repoze.who/blob/${version}/CHANGES.rst";
    license = licenses.bsd0;
    maintainers = [ ];
  };
}
