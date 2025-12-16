duckdb_extension_load(core_functions)
duckdb_extension_load(parquet)
duckdb_extension_load(json)
duckdb_extension_load(icu)
# https://github.com/duckdb/duckdb/blob/v1.4.3/.github/config/extensions/httpfs.cmake
duckdb_extension_load(httpfs
    LOAD TESTS
    GIT_URL https://github.com/duckdb/duckdb-httpfs
    GIT_TAG 9c7d34977b10346d0b4cbbde5df807d1dab0b2bf
    INCLUDE_DIR src/include
)
# https://github.com/duckdb/duckdb/blob/v1.4.3/.github/config/extensions/aws.cmake
duckdb_extension_load(aws
    GIT_URL https://github.com/duckdb/duckdb-aws
    GIT_TAG 55bf3621fb7db254b473c94ce6360643ca38fac0
)
