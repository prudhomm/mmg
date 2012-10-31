###############################################################################
#####
#####         Continuous Integration
#####
###############################################################################

SET(REG_TESTS_PATH ${CMAKE_SOURCE_DIR}/../../RegTests)

# simple test: must already pass
ADD_TEST(NAME SimpleCube
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/Cube/cube.mesh)

###############################################################################
#####
#####         Check Build
#####
###############################################################################
# on agni we can test gcc and icc
#  ADD_CUSTOM_COMMAND(
#    COMMAND ${CMAKE_COMMAND} -E  make clean
#    COMMENT "make clean")


###############################################################################
#####
#####         Check Memory Leak
#####
###############################################################################
#####
#ADD_TEST(NAME LeakCheck_AbnormalEnd0
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd0/d.mesh -DCOMMAND1="chmod -r" -P "chmod.cmake")
#SET(passRegex "LeakCheck_AbnormalEnd0/d.mesh  NOT FOUND.")
#SET_PROPERTY(TEST LeakCheck_AbnormalEnd0
#  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#
#####
#ADD_TEST(NAME LeakCheck_AbnormalEnd1
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd1) ## no possible for now
#SET(passRegex " ")
#SET_PROPERTY(TEST LeakCheck_AbnormalEnd1
#  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
ADD_TEST(NAME LeakCheck_AbnormalEnd2
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd2/d.mesh)
SET(passRegex "## Unable to scale mesh.")
SET_PROPERTY(TEST LeakCheck_AbnormalEnd2
  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
ADD_TEST(NAME LeakCheck_AbnormalEnd3
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd3/d.mesh -sol ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd3/dsol.sol -ls 2)
SET(passRegex "## ERROR : A VALID SOLUTION FILE IS NEEDED")
SET_PROPERTY(TEST LeakCheck_AbnormalEnd3
  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
#ADD_TEST(NAME LeakCheck_AbnormalEnd4
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd4) ## no possible for now
#SET(passRegex " ")
#SET_PROPERTY(TEST LeakCheck_AbnormalEnd4
#  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
#ADD_TEST(NAME LeakCheck_AbnormalEnd5.1
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd5.1) ## todo mmg3d2
#SET(passRegex " ")
#SET_PROPERTY(TEST LeakCheck_AbnormalEnd5.1
#  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
#ADD_TEST(NAME LeakCheck_AbnormalEnd5.2
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd5.2) ## todo mmg3d1
#SET(passRegex " ")
#SET_PROPERTY(TEST LeakCheck_AbnormalEnd5.2
#  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
#ADD_TEST(NAME LeakCheck_AbnormalEnd6
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd6) ## todo analys.c
#SET(passRegex " ")
#SET_PROPERTY(TEST LeakCheck_AbnormalEnd6
#  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
ADD_TEST(NAME LeakCheck_AbnormalEnd7
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd7/d.mesh -out ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd7/dout.mesh)
SET(passRegex "\\*\\* UNABLE TO OPEN.*dout.mesh")
SET_PROPERTY(TEST LeakCheck_AbnormalEnd7
  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
ADD_TEST(NAME LeakCheck_AbnormalEnd8
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_AbnormalEnd8/d.mesh)
SET(passRegex "\\*\\* UNABLE TO OPEN.*d.o.sol")
SET_PROPERTY(TEST LeakCheck_AbnormalEnd8
  PROPERTY PASS_REGULAR_EXPRESSION "${passRegex}")
#####
#####
ADD_TEST(NAME LeakCheck_args0
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/LeakCheck_args0/d.mesh)
#####
ADD_TEST(NAME LeakCheck_args1
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 -in ${REG_TESTS_PATH}/LeakCheck_args1/d.mesh -sol ${REG_TESTS_PATH}/LeakCheck_args1/dsol.sol -out ${REG_TESTS_PATH}/LeakCheck_args1/dout.mesh)

###############################################################################
#####
#####         Check Precision
#####
###############################################################################
#####
ADD_TEST(NAME MeshVersionFormatted1
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 -in ${REG_TESTS_PATH}/MeshVersionFormatted1/d.mesh -sol ${REG_TESTS_PATH}/MeshVersionFormatted1/dsol.sol)
#####
ADD_TEST(NAME MeshVersionFormatted2
  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 -in ${REG_TESTS_PATH}/MeshVersionFormatted2/d.mesh -sol ${REG_TESTS_PATH}/MeshVersionFormatted2/dsol.sol)

###############################################################################
#####
#####         Check Results
#####
###############################################################################
#####
# for now we suppose that we want to obtain th reference result when we run
#ADD_TEST(NAME RefCube
#  COMMAND $ENV{HOME}/bin/$ENV{ARCHI}/mmg3d5 -v 5 ${REG_TESTS_PATH}/RefCube/cube.mesh) marre... a finir
