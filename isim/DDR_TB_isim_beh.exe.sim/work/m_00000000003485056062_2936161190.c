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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Google Drive/Projects/FPGA/ddr_sdram/DDR_TB.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 65535U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {30292U, 0U};
static int ng5[] = {0, 0};
static unsigned int ng6[] = {65244U, 0U};
static int ng7[] = {1, 0};
static unsigned int ng8[] = {39030U, 0U};
static int ng9[] = {2, 0};
static unsigned int ng10[] = {4350U, 0U};
static int ng11[] = {3, 0};
static unsigned int ng12[] = {47768U, 0U};
static int ng13[] = {4, 0};
static unsigned int ng14[] = {12816U, 0U};
static int ng15[] = {5, 0};
static unsigned int ng16[] = {56506U, 0U};
static int ng17[] = {6, 0};
static unsigned int ng18[] = {21554U, 0U};
static int ng19[] = {7, 0};
static int ng20[] = {8, 0};
static int ng21[] = {9, 0};
static int ng22[] = {10, 0};
static int ng23[] = {11, 0};
static int ng24[] = {12, 0};
static int ng25[] = {13, 0};
static int ng26[] = {14, 0};
static int ng27[] = {15, 0};
static unsigned int ng28[] = {3U, 0U};
static unsigned int ng29[] = {2U, 0U};
static unsigned int ng30[] = {8191U, 0U};



static void Cont_43_0(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 7120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5240);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5400);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t7);
    t11 = (t9 ^ t10);
    *((unsigned int *)t8) = t11;
    t12 = (t4 + 4);
    t13 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t12);
    t16 = *((unsigned int *)t13);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB4;

LAB5:
LAB6:    t22 = (t0 + 9336);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t8 + 4);
    t30 = *((unsigned int *)t8);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0);
    t35 = (t0 + 9176);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    goto LAB6;

}

static void Cont_47_1(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 7368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 5560);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5720);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t7);
    t11 = (t9 ^ t10);
    *((unsigned int *)t8) = t11;
    t12 = (t4 + 4);
    t13 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t12);
    t16 = *((unsigned int *)t13);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB4;

LAB5:
LAB6:    t22 = (t0 + 9400);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t8 + 4);
    t30 = *((unsigned int *)t8);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0);
    t35 = (t0 + 9192);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    goto LAB6;

}

static void Cont_54_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t18[8];
    char t19[8];
    char t35[8];
    char t46[8];
    char t54[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;

LAB0:    t1 = (t0 + 7616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 5880);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t64 = *((unsigned int *)t4);
    t65 = (~(t64));
    t66 = *((unsigned int *)t14);
    t67 = (t65 || t66);
    if (t67 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t68, 8);

LAB16:    t69 = (t0 + 9464);
    t70 = (t69 + 56U);
    t71 = *((char **)t70);
    t72 = (t71 + 56U);
    t73 = *((char **)t72);
    memset(t73, 0, 8);
    t74 = 65535U;
    t75 = t74;
    t76 = (t3 + 4);
    t77 = *((unsigned int *)t3);
    t74 = (t74 & t77);
    t78 = *((unsigned int *)t76);
    t75 = (t75 & t78);
    t79 = (t73 + 4);
    t80 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t80 | t74);
    t81 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t81 | t75);
    xsi_driver_vfirst_trans(t69, 0, 15);
    t82 = (t0 + 9208);
    *((int *)t82) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t20 = (t0 + 3240U);
    t21 = *((char **)t20);
    memset(t19, 0, 8);
    t20 = (t21 + 4);
    t22 = *((unsigned int *)t20);
    t23 = (~(t22));
    t24 = *((unsigned int *)t21);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t20) != 0)
        goto LAB19;

LAB20:    t28 = (t19 + 4);
    t29 = *((unsigned int *)t19);
    t30 = *((unsigned int *)t28);
    t31 = (t29 || t30);
    if (t31 > 0)
        goto LAB21;

LAB22:    t47 = *((unsigned int *)t19);
    t48 = (~(t47));
    t49 = *((unsigned int *)t28);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t28) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t19) > 0)
        goto LAB27;

LAB28:    memcpy(t18, t54, 8);

LAB29:    goto LAB9;

LAB10:    t68 = ((char*)((ng2)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 16, t18, 16, t68, 16);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t19) = 1;
    goto LAB20;

LAB19:    t27 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB20;

LAB21:    t32 = (t0 + 6200);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t36 = (t0 + 6200);
    t37 = (t36 + 72U);
    t38 = *((char **)t37);
    t39 = (t0 + 6200);
    t40 = (t39 + 64U);
    t41 = *((char **)t40);
    t42 = (t0 + 6040);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = ((char*)((ng1)));
    memset(t46, 0, 8);
    xsi_vlog_unsigned_add(t46, 4, t44, 4, t45, 4);
    xsi_vlog_generic_get_array_select_value(t35, 16, t34, t38, t41, 2, 1, t46, 4, 2);
    goto LAB22;

LAB23:    t51 = (t0 + 6200);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    t55 = (t0 + 6200);
    t56 = (t55 + 72U);
    t57 = *((char **)t56);
    t58 = (t0 + 6200);
    t59 = (t58 + 64U);
    t60 = *((char **)t59);
    t61 = (t0 + 6040);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    xsi_vlog_generic_get_array_select_value(t54, 16, t53, t57, t60, 2, 1, t63, 4, 2);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t18, 16, t35, 16, t54, 16);
    goto LAB29;

LAB27:    memcpy(t18, t35, 8);
    goto LAB29;

}

static void Initial_97_3(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    int t14;
    char *t15;
    unsigned int t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    int t21;
    int t22;

LAB0:    xsi_set_current_line(97, ng0);

LAB2:    xsi_set_current_line(99, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 4440);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(101, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 4600);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 2, 0LL);
    xsi_set_current_line(102, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 4920);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 10, 0LL);
    xsi_set_current_line(103, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 4760);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 13, 0LL);
    xsi_set_current_line(105, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 5240);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(106, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 5400);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(107, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 5560);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(108, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 5720);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(109, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 5880);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(110, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 6040);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 4, 0LL);
    xsi_set_current_line(114, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng5)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB3;

LAB4:    xsi_set_current_line(115, ng0);
    t1 = ((char*)((ng6)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng7)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    xsi_set_current_line(116, ng0);
    t1 = ((char*)((ng8)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng9)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(117, ng0);
    t1 = ((char*)((ng10)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng11)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(118, ng0);
    t1 = ((char*)((ng12)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng13)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(119, ng0);
    t1 = ((char*)((ng14)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng15)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(120, ng0);
    t1 = ((char*)((ng16)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng17)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(121, ng0);
    t1 = ((char*)((ng18)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng19)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB17;

LAB18:    xsi_set_current_line(122, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng20)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(123, ng0);
    t1 = ((char*)((ng6)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng21)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB21;

LAB22:    xsi_set_current_line(124, ng0);
    t1 = ((char*)((ng8)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng22)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB23;

LAB24:    xsi_set_current_line(125, ng0);
    t1 = ((char*)((ng10)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng23)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB25;

LAB26:    xsi_set_current_line(126, ng0);
    t1 = ((char*)((ng12)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng24)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB27;

LAB28:    xsi_set_current_line(127, ng0);
    t1 = ((char*)((ng14)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng25)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB29;

LAB30:    xsi_set_current_line(128, ng0);
    t1 = ((char*)((ng16)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng26)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB31;

LAB32:    xsi_set_current_line(129, ng0);
    t1 = ((char*)((ng18)));
    t2 = (t0 + 6200);
    t5 = (t0 + 6200);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 6200);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng27)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB33;

LAB34:
LAB1:    return;
LAB3:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB4;

LAB5:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB6;

LAB7:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB8;

LAB9:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB10;

LAB11:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB12;

LAB13:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB14;

LAB15:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB16;

LAB17:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB18;

LAB19:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB20;

LAB21:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB22;

LAB23:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB24;

LAB25:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB26;

LAB27:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB28;

LAB29:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB30;

LAB31:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB32;

LAB33:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, *((unsigned int *)t4), t22, 0LL);
    goto LAB34;

}

static void Always_133_4(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 8112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(133, ng0);

LAB4:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 7920);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(134, ng0);
    t4 = (t0 + 4440);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t7) == 0)
        goto LAB6;

LAB8:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB9:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB10:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 4440);
    xsi_vlogvar_wait_assign_value(t24, t3, 0, 0, 1, 0LL);
    goto LAB2;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

LAB11:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB10;

}

static void Always_137_5(char *t0)
{
    char t6[8];
    char t31[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;

LAB0:    t1 = (t0 + 8360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 9224);
    *((int *)t2) = 1;
    t3 = (t0 + 8392);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(137, ng0);

LAB5:    xsi_set_current_line(138, ng0);
    t4 = (t0 + 608);
    t5 = *((char **)t4);
    t4 = ((char*)((ng7)));
    memset(t6, 0, 8);
    xsi_vlog_signed_equal(t6, 32, t5, 32, t4, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(154, ng0);
    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t2 = ((char*)((ng9)));
    memset(t6, 0, 8);
    xsi_vlog_signed_equal(t6, 32, t3, 32, t2, 32);
    t4 = (t6 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB36;

LAB37:
LAB38:    goto LAB2;

LAB6:    xsi_set_current_line(138, ng0);

LAB9:    xsi_set_current_line(139, ng0);
    t13 = (t0 + 5720);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t15);
    t20 = (t19 & t18);
    t21 = (t20 != 0);
    if (t21 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5560);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB12:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 4600);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng28)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t13 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t7);
    t12 = *((unsigned int *)t13);
    t17 = (t11 ^ t12);
    t18 = (t10 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t13);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB16;

LAB13:    if (t21 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t6) = 1;

LAB16:    t15 = (t6 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 4600);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 2, t4, 2, t5, 2);
    t7 = (t0 + 4600);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 2, 0LL);

LAB19:    goto LAB8;

LAB10:    xsi_set_current_line(139, ng0);
    t22 = ((char*)((ng3)));
    t23 = (t0 + 5560);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 1, 0LL);
    goto LAB12;

LAB15:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB16;

LAB17:    xsi_set_current_line(142, ng0);

LAB20:    xsi_set_current_line(143, ng0);
    t16 = ((char*)((ng3)));
    t22 = (t0 + 4600);
    xsi_vlogvar_wait_assign_value(t22, t16, 0, 0, 2, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 4920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    t7 = ((char*)((ng29)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 10, t5, 10, t7, 5);
    memset(t31, 0, 8);
    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t6);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t13);
    t12 = *((unsigned int *)t14);
    t17 = (t11 ^ t12);
    t18 = (t10 | t17);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB24;

LAB21:    if (t21 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t31) = 1;

LAB24:    t16 = (t31 + 4);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t31);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng29)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 10, t4, 10, t5, 5);
    t7 = (t0 + 4920);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 10, 0LL);

LAB27:    goto LAB19;

LAB23:    t15 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(144, ng0);

LAB28:    xsi_set_current_line(145, ng0);
    t22 = ((char*)((ng3)));
    t23 = (t0 + 4920);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 10, 0LL);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 4760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng30)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t13 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t7);
    t12 = *((unsigned int *)t13);
    t17 = (t11 ^ t12);
    t18 = (t10 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t13);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB32;

LAB29:    if (t21 != 0)
        goto LAB31;

LAB30:    *((unsigned int *)t6) = 1;

LAB32:    t15 = (t6 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 4760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 13, t4, 13, t5, 13);
    t7 = (t0 + 4760);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 13, 0LL);

LAB35:    goto LAB27;

LAB31:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB32;

LAB33:    xsi_set_current_line(146, ng0);
    t16 = ((char*)((ng3)));
    t22 = (t0 + 4760);
    xsi_vlogvar_wait_assign_value(t22, t16, 0, 0, 13, 0LL);
    goto LAB35;

LAB36:    xsi_set_current_line(154, ng0);

LAB39:    xsi_set_current_line(155, ng0);
    t5 = (t0 + 5400);
    t7 = (t5 + 56U);
    t13 = *((char **)t7);
    t14 = (t13 + 4);
    t17 = *((unsigned int *)t14);
    t18 = (~(t17));
    t19 = *((unsigned int *)t13);
    t20 = (t19 & t18);
    t21 = (t20 != 0);
    if (t21 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5240);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB42:    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng29)));
    t3 = ((char*)((ng29)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 5, t2, 5, t3, 5);
    t4 = (t0 + 5080);
    xsi_vlogvar_wait_assign_value(t4, t6, 0, 0, 4, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 4600);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng28)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t13 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t7);
    t12 = *((unsigned int *)t13);
    t17 = (t11 ^ t12);
    t18 = (t10 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t13);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB46;

LAB43:    if (t21 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t6) = 1;

LAB46:    t15 = (t6 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(169, ng0);
    t2 = (t0 + 4600);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 2, t4, 2, t5, 2);
    t7 = (t0 + 4600);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 2, 0LL);

LAB49:    goto LAB38;

LAB40:    xsi_set_current_line(155, ng0);
    t15 = ((char*)((ng3)));
    t16 = (t0 + 5240);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 1, 0LL);
    goto LAB42;

LAB45:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(160, ng0);

LAB50:    xsi_set_current_line(161, ng0);
    t16 = ((char*)((ng3)));
    t22 = (t0 + 4600);
    xsi_vlogvar_wait_assign_value(t22, t16, 0, 0, 2, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 4920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    t7 = ((char*)((ng29)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_minus(t6, 10, t5, 10, t7, 5);
    memset(t31, 0, 8);
    t13 = (t4 + 4);
    t14 = (t6 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t6);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t13);
    t12 = *((unsigned int *)t14);
    t17 = (t11 ^ t12);
    t18 = (t10 | t17);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB54;

LAB51:    if (t21 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t31) = 1;

LAB54:    t16 = (t31 + 4);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t31);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 4920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng29)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 10, t4, 10, t5, 5);
    t7 = (t0 + 4920);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 10, 0LL);

LAB57:    goto LAB49;

LAB53:    t15 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(162, ng0);

LAB58:    xsi_set_current_line(163, ng0);
    t22 = ((char*)((ng3)));
    t23 = (t0 + 4920);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 10, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 4760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng30)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t13 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t7);
    t12 = *((unsigned int *)t13);
    t17 = (t11 ^ t12);
    t18 = (t10 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t13);
    t21 = (t19 | t20);
    t24 = (~(t21));
    t25 = (t18 & t24);
    if (t25 != 0)
        goto LAB62;

LAB59:    if (t21 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t6) = 1;

LAB62:    t15 = (t6 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB63;

LAB64:    xsi_set_current_line(165, ng0);
    t2 = (t0 + 4760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 13, t4, 13, t5, 13);
    t7 = (t0 + 4760);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 13, 0LL);

LAB65:    goto LAB57;

LAB61:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB62;

LAB63:    xsi_set_current_line(164, ng0);
    t16 = ((char*)((ng3)));
    t22 = (t0 + 4760);
    xsi_vlogvar_wait_assign_value(t22, t16, 0, 0, 13, 0LL);
    goto LAB65;

}

static void Always_173_6(char *t0)
{
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 8608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(173, ng0);
    t2 = (t0 + 9240);
    *((int *)t2) = 1;
    t3 = (t0 + 8640);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(173, ng0);

LAB5:    xsi_set_current_line(175, ng0);
    t4 = (t0 + 1320U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(180, ng0);
    t2 = (t0 + 1480U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB14;

LAB15:
LAB16:    goto LAB2;

LAB6:    xsi_set_current_line(175, ng0);

LAB9:    xsi_set_current_line(176, ng0);
    t12 = (t0 + 5400);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memset(t11, 0, 8);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t14);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t15) == 0)
        goto LAB10;

LAB12:    t21 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t21) = 1;

LAB13:    t22 = (t0 + 5400);
    xsi_vlogvar_wait_assign_value(t22, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t11) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(180, ng0);

LAB17:    xsi_set_current_line(181, ng0);
    t4 = (t0 + 5720);
    t5 = (t4 + 56U);
    t12 = *((char **)t5);
    memset(t11, 0, 8);
    t13 = (t12 + 4);
    t16 = *((unsigned int *)t13);
    t17 = (~(t16));
    t18 = *((unsigned int *)t12);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB21;

LAB19:    if (*((unsigned int *)t13) == 0)
        goto LAB18;

LAB20:    t14 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t14) = 1;

LAB21:    t15 = (t0 + 5720);
    xsi_vlogvar_wait_assign_value(t15, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(182, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5880);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB16;

LAB18:    *((unsigned int *)t11) = 1;
    goto LAB21;

}

static void Always_188_7(char *t0)
{
    char t9[8];
    char t10[8];
    char t14[8];
    char t28[8];
    char t35[8];
    char t77[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    int t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    char *t78;

LAB0:    t1 = (t0 + 8856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(188, ng0);
    t2 = (t0 + 9256);
    *((int *)t2) = 1;
    t3 = (t0 + 8888);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(188, ng0);

LAB5:    xsi_set_current_line(190, ng0);
    t4 = (t0 + 6040);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng29)));
    t8 = ((char*)((ng29)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_minus(t9, 5, t7, 5, t8, 5);
    memset(t10, 0, 8);
    t11 = (t6 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB7;

LAB6:    t12 = (t9 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) < *((unsigned int *)t9))
        goto LAB8;

LAB9:    memset(t14, 0, 8);
    t15 = (t10 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t10);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t15) != 0)
        goto LAB13;

LAB14:    t22 = (t14 + 4);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t22);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB15;

LAB16:    memcpy(t35, t14, 8);

LAB17:    t67 = (t35 + 4);
    t68 = *((unsigned int *)t67);
    t69 = (~(t68));
    t70 = *((unsigned int *)t35);
    t71 = (t70 & t69);
    t72 = (t71 != 0);
    if (t72 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 6040);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB27:    goto LAB2;

LAB7:    t13 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t10) = 1;
    goto LAB9;

LAB11:    *((unsigned int *)t14) = 1;
    goto LAB14;

LAB13:    t21 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB14;

LAB15:    t26 = (t0 + 3080U);
    t27 = *((char **)t26);
    memset(t28, 0, 8);
    t26 = (t27 + 4);
    t29 = *((unsigned int *)t26);
    t30 = (~(t29));
    t31 = *((unsigned int *)t27);
    t32 = (t31 & t30);
    t33 = (t32 & 1U);
    if (t33 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t26) != 0)
        goto LAB20;

LAB21:    t36 = *((unsigned int *)t14);
    t37 = *((unsigned int *)t28);
    t38 = (t36 & t37);
    *((unsigned int *)t35) = t38;
    t39 = (t14 + 4);
    t40 = (t28 + 4);
    t41 = (t35 + 4);
    t42 = *((unsigned int *)t39);
    t43 = *((unsigned int *)t40);
    t44 = (t42 | t43);
    *((unsigned int *)t41) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 != 0);
    if (t46 == 1)
        goto LAB22;

LAB23:
LAB24:    goto LAB17;

LAB18:    *((unsigned int *)t28) = 1;
    goto LAB21;

LAB20:    t34 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB21;

LAB22:    t47 = *((unsigned int *)t35);
    t48 = *((unsigned int *)t41);
    *((unsigned int *)t35) = (t47 | t48);
    t49 = (t14 + 4);
    t50 = (t28 + 4);
    t51 = *((unsigned int *)t14);
    t52 = (~(t51));
    t53 = *((unsigned int *)t49);
    t54 = (~(t53));
    t55 = *((unsigned int *)t28);
    t56 = (~(t55));
    t57 = *((unsigned int *)t50);
    t58 = (~(t57));
    t59 = (t52 & t54);
    t60 = (t56 & t58);
    t61 = (~(t59));
    t62 = (~(t60));
    t63 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t63 & t61);
    t64 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t64 & t62);
    t65 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t65 & t61);
    t66 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t66 & t62);
    goto LAB24;

LAB25:    xsi_set_current_line(190, ng0);
    t73 = (t0 + 6040);
    t74 = (t73 + 56U);
    t75 = *((char **)t74);
    t76 = ((char*)((ng29)));
    memset(t77, 0, 8);
    xsi_vlog_unsigned_add(t77, 4, t75, 4, t76, 4);
    t78 = (t0 + 6040);
    xsi_vlogvar_wait_assign_value(t78, t77, 0, 0, 4, 0LL);
    goto LAB27;

}


extern void work_m_00000000003485056062_2936161190_init()
{
	static char *pe[] = {(void *)Cont_43_0,(void *)Cont_47_1,(void *)Cont_54_2,(void *)Initial_97_3,(void *)Always_133_4,(void *)Always_137_5,(void *)Always_173_6,(void *)Always_188_7};
	xsi_register_didat("work_m_00000000003485056062_2936161190", "isim/DDR_TB_isim_beh.exe.sim/work/m_00000000003485056062_2936161190.didat");
	xsi_register_executes(pe);
}
