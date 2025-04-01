{
  buildPythonPackage,
  fetchPypi,
  lib,
  setuptools,
  deprecation,
  packaging,
}:
buildPythonPackage rec {
  pname = "deprecation-alias";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pY0udEkceDTp0xh4jaYCcvovga64FLQFWkupCgpBdA8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    deprecation
    packaging
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools!=61.*,<=67.1.0,>=40.6.0"' '"setuptools"'
  '';

  meta = {
    description = "A wrapper around ‘deprecation’ providing support for deprecated aliases.";
    homepage = "https://github.com/domdfcoding/deprecation-alias";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ tyberius-prime ];
  };
}
