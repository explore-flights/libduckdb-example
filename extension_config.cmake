duckdb_extension_load(core_functions)
duckdb_extension_load(parquet)
duckdb_extension_load(json)
duckdb_extension_load(icu)
# https://github.com/duckdb/duckdb/blob/v1.5.1/.github/config/extensions/httpfs.cmake
duckdb_extension_load(httpfs
    LOAD_TESTS
    GIT_URL https://github.com/duckdb/duckdb-httpfs
    GIT_TAG 7e86e7a5e5a1f01f458361bebdfa9b0a9a73a619
)
# https://github.com/duckdb/duckdb/blob/v1.5.1/.github/config/extensions/aws.cmake
duckdb_extension_load(aws
    LOAD_TESTS
    GIT_URL https://github.com/duckdb/duckdb-aws
    GIT_TAG b2649e68341a9ee717588dd23f277904727ce793
)
