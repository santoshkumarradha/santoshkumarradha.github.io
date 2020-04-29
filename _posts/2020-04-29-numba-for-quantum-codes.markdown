---
layout: post
title:  Numba for Quantum optimization
date:   2020-04-29 16:40:16
description: Speeding the way
tags: numba python tight-binding optimization Slaster-koster pysktb
mathjax: true
---

Another appreciation post for numba. Couple of years ago, I had developed this package ([pySKTB](https://github.com/santoshkumarradha/pysktb)) to help with calculating Eigen spectrum of system with co-dimensions $>1$. This was done so that I could in theory do rudimentary testing of different symmetries and how it couples to the orbital/real-space symmetry. But one of the major problem I had was that the code was really clunky. Of course as is the case of all theoretical physics development, it happened because of adding bits and peaces when and wherever needed. After dabbling with numba, I learnt about the existence of couple of new tools like `line_profiler` which seems to be extremely useful for optimizing codes and I am baffled that i have never used this. But anyway, for people not familiar with this, it spits out time of run for each line in your code. Of-course the code being the beast it is, mine had every possible line sitting like a chump standing a solid ground. So I started with the biggest of a the chump, which was calculating $g_{ij}$, which is the $g$ matrix for connecting sites. Next comes the big catch, unlike normal jit, one cannot just add a decorator inside for this as calculating $g$ was done in a class. So the easiest plan i could think of was to add all numba functions in a separate module of optimized function and call it when needed from the main module's class. So I took the calculation off and added it to a separate module that i called optimizer and made it something like 
```python
@nb.jit(nopython=False)
def get_gmat_jit(g_mat,all_iter,max_image,n_orbitals,bond_mat,dist_mat_vec,kpt_cart):
	for ind_1, (atom_1_i, orbit_1_i, element_1, orbit_1) in enumerate(all_iter):
		for ind_2, (atom_2_i, orbit_2_i, element_2, orbit_2) in enumerate(all_iter):
			for image_ind in range(max_image):
				if bond_mat[image_ind, atom_1_i, atom_2_i] == 0:
					continue
				dist_vec = dist_mat_vec[image_ind, atom_1_i, atom_2_i, :]

				phase = np.exp(2.*np.pi*1j * np.dot(kpt_cart, dist_vec))
				g_mat[image_ind, ind_1, ind_2] = phase
	g_mat[int(max_image/2), :, :] += np.eye(n_orbitals, dtype=complex)
	return g_mat
```

This unfortunately seems to through error when `nopython=True`. This usually happens because of the use of non fundamental objects like custom class object inside jit, but as far as I can see there seems to be nothing like that. But ignoring that and running in nopython mode still gave a huge boost to the performance. Here is a bench mark of that with respect to number of sites in the system (represented by supercell)
<p align="center">
  <img width="50%" src="{{ site.baseurl }}/assets/img/pysktb_numba.png"/>
</p>

Almost order $\approx 10$ improvement, not bad for couple of minutes of work. Next stop would be to parallelize the calculation with dask. But thats for another day.