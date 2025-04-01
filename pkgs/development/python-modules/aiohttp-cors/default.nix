{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  typing ? null,
  aiohttp,
}:

buildPythonPackage rec {
  pname = "aiohttp-cors";
  version = "0.8.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-zKz5y4S2STnqFfhZoUavH2Yqax1oF1dUoHMV4wX7FAM=";
  };

  disabled = pythonOlder "3.5";

  propagatedBuildInputs = [ aiohttp ] ++ lib.optional (pythonOlder "3.5") typing;

  # Requires network access
  doCheck = false;

  meta = with lib; {
    description = "CORS support for aiohttp";
    homepage = "https://github.com/aio-libs/aiohttp-cors";
    license = licenses.asl20;
    maintainers = with maintainers; [ primeos ];
  };
}
