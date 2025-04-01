{
  lib,
  buildPythonPackage,
  fetchPypi,
  pbr,
  setuptools,
  testtools,
  mock,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "fixtures";
  version = "4.2.4.post1";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-A0xL0d6qYKW/y2CM5T2Z6Dkr9HyRplNgWuvdagUkjy4=";
  };

  nativeBuildInputs = [
    pbr
    setuptools
  ];

  propagatedBuildInputs = [ pbr ];

  optional-dependencies = {
    streams = [ testtools ];
  };

  nativeCheckInputs = [
    mock
    pytestCheckHook
  ] ++ optional-dependencies.streams;

  meta = {
    description = "Reusable state for writing clean tests and more";
    homepage = "https://pypi.org/project/fixtures/";
    changelog = "https://github.com/testing-cabal/fixtures/blob/${version}/NEWS";
    license = lib.licenses.asl20;
  };
}
