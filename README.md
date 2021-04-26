# ColorTransfer_PZhai_ZYu

By Peiyuan Zhai & Zhuangzhuang Yu

## Introduction

This is a project containing the final project of Course AP3132 from TU Delft. The Project is mainly based on the following paper.

> [Pitie07a] Automated colour grading using colour distribution transfer.
> F. Pitie , A. Kokaram and R. Dahyot (2007) Computer Vision and Image
> Understanding.


In this project, we realize the IDT algorithm and reduce the grain artifect with proposed algorithm.

## IDT algorithm

The IDT algorithm is an application of 1D probability density function (pdf) transfer to a higher dimension. Basic idea is to project the high dimension samples (3-D here) iteratively onto three 1-D axis. These axis are orthogonal to each other. For example, consider a 3-D data set with M samples<img src="https://render.githubusercontent.com/render/math?math=U=\{u_1,u_2,\cdots,u_M\}">. For each sample <img src="https://render.githubusercontent.com/render/math?math=u_i\in U\}">, there is <img src="https://render.githubusercontent.com/render/math?math=u_i=[u_{i,1},u_{i,2},u_{i,3}]\}">.

