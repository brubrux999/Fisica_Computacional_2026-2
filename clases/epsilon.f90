!gfortran, gcc version 5.4.0 20160609

program epsilon
implicit none
integer, parameter :: DP=8, SP=4
real(DP) :: eps_d, x_d
real(SP) :: eps_s, x_s

read *,x_d,x_s
!x_d=4.0_DP
!x_s=4.0_SP

print *,"x_d=",x_d
print *,"x_s=",x_s

eps_d=1.0_DP
eps_s=1.0_SP
do while (1.0_SP+eps_s > 1.0_SP)
  eps_s=eps_s/2
end do
do while (1.0_DP+eps_d > 1.0_DP)
  eps_d=eps_d/2
end do
print *,"single precision epsilon=",eps_s
print *,"double precision epsilon=",eps_d

x_d=x_d+eps_d
x_s=x_s+eps_s
print *,"x_d+eps_d=",x_d
print *,"x_s+eps_s=",x_s
end program epsilon
