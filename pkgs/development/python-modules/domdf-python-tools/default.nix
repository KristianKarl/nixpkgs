{
  buildPythonPackage,
  fetchPypi,
  lib,
  setuptools,
  natsort,
  typing-extensions,
}:
buildPythonPackage rec {
  pname = "domdf-python-tools";
  version = "3.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "domdf_python_tools";
    hash = "sha256-KuMI0vTx6RRfX0ulf4QPv9HCmD7ibkgkNHeJZJ064pg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    natsort
    typing-extensions
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools!=61.*,<=67.1.0,>=40.6.0"' '"setuptools"'
  '';

  meta = {
    description = "Helpful functions for Python";
    homepage = "https://github.com/domdfcoding/domdf_python_tools";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ tyberius-prime ];
  };
}
