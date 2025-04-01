{
  lib,
  fetchPypi,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "markuppy";
  version = "1.18";
  format = "setuptools";

  src = fetchPypi {
    pname = "MarkupPy";
    inherit version;
    hash = "sha256-VA8xuDUHYmAzk2iJCsT0TrOXHXX9vZe0n6H4tmhVE9M=";
  };

  # has no tests
  doCheck = false;

  pythonImportsCheck = [ "MarkupPy" ];

  meta = with lib; {
    description = "HTML/XML generator";
    homepage = "https://github.com/tylerbakke/MarkupPy";
    license = licenses.mit;
    maintainers = with maintainers; [ sephi ];
  };
}
