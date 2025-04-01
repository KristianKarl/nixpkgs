{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  fetchpatch,
  hpack,
  hyperframe,
  pytestCheckHook,
  hypothesis,
}:

buildPythonPackage rec {
  pname = "h2";
  version = "4.2.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yKUhKWleiLGgV42NLMaEK715EorGhUY7iH7ieBJq0B8=";
  };

  patches = [
    # https://github.com/python-hyper/h2/pull/1274
    (fetchpatch {
      name = "fix-tests-in-python-3.11.patch";
      url = "https://github.com/python-hyper/h2/commit/8952c91606cd014720ccf202a25b5ee1fbed1591.patch";
      hash = "sha256-skAdAVHMZo1xJEqqKa6FOKPvoQQbGUgGsQjE11jIjtw=";
    })
  ];

  propagatedBuildInputs = [
    hpack
    hyperframe
  ];

  nativeCheckInputs = [
    pytestCheckHook
    hypothesis
  ];

  disabledTests = [
    # timing sensitive
    "test_changing_max_frame_size"
  ];

  pythonImportsCheck = [
    "h2.connection"
    "h2.config"
  ];

  meta = with lib; {
    description = "HTTP/2 State-Machine based protocol implementation";
    homepage = "https://github.com/python-hyper/h2";
    license = licenses.mit;
    maintainers = [ ];
  };
}
