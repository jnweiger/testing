def pipeline(name, arch):
  return {
    "kind": "pipeline",
    "type": "docker",
    "name": name,
    "platform": {
      "os": "linux",
      "arch": arch,
    },
    "steps": [
      {
        "name": "test",
        "image": "debian:latest",
        "commands": [
          "echo \"Hello world. This is .drone.star\"",
          "uname -m",
          "pwd",
          "cat /etc/hosts",
          "env",
        ]
      }
    ]
  }

def main(ctx):
  return [
    pipeline("arm64", "arm64"),
    pipeline("arm32", "arm")
  ]
