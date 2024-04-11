{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

  # https://devenv.sh/packages/
  packages = [ 
    pkgs.poetry
    pkgs.git
    pkgs.python311   
  ];

  # https://devenv.sh/scripts/
  # scripts.hello.exec = "p";

  enterShell = ''
    poetry --version
    python --version
    git --version
    poetry install
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    wait_for_port 8888
    curl -s localhost:8888/lab
  '';
              
  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  processes.jupyter.exec = "poetry install && poetry run jupyter lab";
  devcontainer.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
