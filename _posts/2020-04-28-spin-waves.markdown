---
layout: post
title:  Spin Waves from spin susceptibility
date:   2020-04-28 16:40:16
description: Part 1 Heisenberg interaction J<sub>ij</sub>
tags: physics spin-waves susceptibility 
mathjax: true
---

I have been studying this amazing idea put forth by Takao Kotani and Mark van Schilfgaarde in [this](http://dx.doi.org/10.1088/0953-8984/20/29/295214) paper where they interestingly come up with a way to calculate spin waves from transverse spin susceptibilities. Before that it is also interesting to first introduce and get familiar with the idea of calculating Heisenberg interaction $J_{ij}$ for a spin Hamiltonian described by 

$$\begin{equation}\mathcal{H}=\sum_{ij}J_{ij}\hat{S}_i \hat{S}_j\end{equation}\label{eq:1}$$

 The usual way to calculate this *ab-initio* is to do super-cell multi-level energy calculations i.e. one would calculate the total energy of FM and different AFM configurations from which the energy needed to flip a single spin can be extracted. But the second and more less *brute-forcey* way is to use perturbation theory. Before going into spin waves, I think it is important to get that out of the way and this post would be concerning that.

 We start by writing down the time ordered transverse spin susceptibility as

\\[\begin{equation}\chi^{+-}\left(\mathbf{r}, \mathbf{r}^{\prime}, t-t^{\prime}\right)=-\mathrm{i}\left\langle T\left(\hat{S}^{+}(\mathbf{r}, t) \hat{S}^{-}\left(\mathbf{r}^{\prime}, t^{\prime}\right)\right)\right\rangle\end{equation}\label{eq:2}\\]

 Here, $T$ denotes the time ordering while $$\hat{S}^{\pm}(\mathbf{r}, t)=\hat{S}^{x}(\mathbf{r}, t) \pm \mathrm{i} \hat{S}^{y}(\mathbf{r}, t)$$ with $S_i$ being the spin density operators. Further let us impose collinearity in the system with the spin direction along $z$ which gives us $$<S_x>=<S_y>=0$$. Focusing on the $z$ component, we have that to be

\\[\begin{equation}2\left\langle\hat{S}^{z}(\mathbf{r}, t)\right\rangle=M(\mathbf{r})\end{equation}\label{eq:3}\\]

 where we have $$M(\mathbf{r})=n^{\uparrow}(\mathbf{r})-n^{\downarrow}(\mathbf{r})$$ is the magnetic moment which for our case would be a vector given by $M_i(\mathbf{r}) \forall i \in$ atoms. (to be continued soon...)
