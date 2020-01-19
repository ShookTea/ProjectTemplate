# ProjectTemplate
Project template with newest version of Vue and Symfony, Docker-based, with CI for GitLab

## How to use

1. Clone this repository somewhere
2. Execute `./run.sh DIRNAME REPONAME`, where:
    * "DIRNAME" is relative directory to place where project will be generated. Default: "build"
    * "REPONAME" is URL to GitLab Docker image repository that will be used for storing both main application image
        and `php-dev` image. Default: "registry.gitlab.com/shooktea/teamdriver"
