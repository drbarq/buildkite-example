steps:
  - label: "Verify Buildkite Directory Structure"
    command:
      - "ls -R"

  - label: "Build Go Application"
    plugins:
      - docker-compose#v3.0.3:
          build: app
    artifact_paths:
      - "hello_binary"

  - label: ":magic_wand: Let's Begin"
    key: "begin"
    command: ".buildkite/setup.sh"