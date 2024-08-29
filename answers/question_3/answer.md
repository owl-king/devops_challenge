Simple build for golang image
The pipeline contains 2 steps: 
- Test: Format with `go fmt` and `go vet` then runs the test with `go test`
- Build: Build binary to `export` folder

Output: [./.gitlab-ci.yml](.gitlab-ci.yml)

## Ref:
- https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Go.gitlab-ci.yml
