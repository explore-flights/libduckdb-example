duckdb_extension_load(core_functions)
duckdb_extension_load(parquet)
duckdb_extension_load(json)
duckdb_extension_load(icu)
# https://github.com/duckdb/duckdb/blob/v1.4.4/.github/config/extensions/httpfs.cmake
duckdb_extension_load(httpfs
    LOAD_TESTS
    GIT_URL https://github.com/duckdb/duckdb-httpfs
    GIT_TAG 13f8a814d41a978c3f19eb1dc76069489652ea6f
    INCLUDE_DIR src/include
)
# https://github.com/duckdb/duckdb/blob/v1.4.4/.github/config/extensions/aws.cmake
duckdb_extension_load(aws
    GIT_URL https://github.com/duckdb/duckdb-aws
    GIT_TAG bc15d211f282d1d78fc0d9fda3d09957ba776423
)
