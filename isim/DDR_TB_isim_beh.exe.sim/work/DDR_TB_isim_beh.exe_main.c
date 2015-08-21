/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    unisims_ver_m_00000000001946988858_2297623829_init();
    unisims_ver_m_00000000004091665089_1657054744_init();
    unisims_ver_m_00000000003084551676_0747896519_init();
    unisims_ver_m_00000000003266096158_2593380106_init();
    work_m_00000000000561338324_0421693030_init();
    unisims_ver_m_00000000004146189403_3839349792_init();
    work_m_00000000000177211095_1959231294_init();
    work_m_00000000001565269458_2936161190_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001565269458_2936161190");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
