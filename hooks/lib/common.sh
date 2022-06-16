read_list() {
    declare -a arr=()
    local prefix=$1
    local i=0
    local parameter="${prefix}_${i}"
    while [[ -n "${!parameter:-}" ]]; do
        arr+=("${!parameter}")
        ((i=i+1))
        parameter="${prefix}_${i}"
    done
    echo "${arr[@]}"
}

pull_image() {
    # pull_image name tag
    docker pull "${$1:$2}"
}

build_push_image(){
    # build_push_image dockerfileName imageName tag
    DOCKER_BUILDKIT=1 docker build -f $1 --ssh bitbucket=$HOME/.ssh/id_rsa --progress=plain  -t "${$2:$3}"
    docker push "${$2:$3}"
}
# read_list BUILDKITE_PLUGIN_AZURE_ACR_CACHE_FILES


