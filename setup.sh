PRE_PROJECT_NAME="python-blueprint"
TARGETS=(
    .devcontainer
    uv.lock
    pyproject.toml
    setup.sh
)

read -p "Project Name: " PROJECT_NAME

for target in "${TARGETS[@]}"; do
    if [ -d "$target" ]; then
        find "$target" -type f -print0 | while IFS= read -r -d '' file; do
            sed -i "s/$PRE_PROJECT_NAME/$PROJECT_NAME/g" "$file"
            echo "replaced: $file"
        done
    elif [ -f "$target" ]; then
        sed -i "s/$PRE_PROJECT_NAME/$PROJECT_NAME/g" "$target"
        echo "replaced: $target"
    fi
done
