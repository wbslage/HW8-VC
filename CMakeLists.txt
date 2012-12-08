#This is for the extra credit portion of the cpts224 project
cmake_minimum_required ( VERSION 2.6)
project ( extracredit )
add_library ( cma cma.c )

add_executable( ma ma.c )
target_link_libraries ( ma cma )
