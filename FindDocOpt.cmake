# Try to find DocOpt
# Once done this will define
#
#  DOCOPT_FOUND - system has DocOpt
#  DOCOPT_INCLUDE_DIRS - the DocOpt include directory
#  DOCOPT_LIBRARIES - Link these to use DocOpt
#  DOCOPT_DEFINITIONS - Compiler switches required for using DocOpt
#
#  Copyright (c) 2016 broke <wutbroke@gmail.com>

if (DOCOPT_LIBRARIES AND DOCOPT_INCLUDE_DIRS)

  set(DOCOPT_FOUND TRUE)

else (DOCOPT_LIBRARIES AND DOCOPT_INCLUDE_DIRS)

  find_path(DOCOPT_INCLUDE_DIR
    NAMES
      docopt.h
    PATHS
      /usr/include
      /usr/local/include
      /opt/local/include
      /sw/include
    PATH_SUFFIXES
      docopt
  )

  find_library(DOCOPT_LIBRARY
    NAMES
      docopt
    PATHS
      /usr/lib
      /usr/local/lib
      /opt/local/lib
      /sw/lib
  )

  set(DOCOPT_INCLUDE_DIRS
    ${DOCOPT_INCLUDE_DIR}
  )

  if (DOCOPT_LIBRARY)
    set(DOCOPT_LIBRARIES
        ${DOCOPT_LIBRARIES}
        ${DOCOPT_LIBRARY}
    )
  endif (DOCOPT_LIBRARY)

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(DocOpt DEFAULT_MSG DOCOPT_LIBRARIES DOCOPT_INCLUDE_DIRS)

  mark_as_advanced(DOCOPT_INCLUDE_DIRS DOCOPT_LIBRARIES)

endif (DOCOPT_LIBRARIES AND DOCOPT_INCLUDE_DIRS)