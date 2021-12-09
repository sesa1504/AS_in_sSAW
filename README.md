# Acoustic streaming in a standing surface acoustic wave field

Experimentally and numerically obtained velocity fields as described in our paper: "On the acoustically induced fluid flow in particle separation systems employing standing surface acoustic waves – Part I".

DOI: tba

Please cite as:
```
@article{DOI, 
	author={Sebastian Sachs and Christian Cierpka and Jörg König}, 
	title={On the acoustically induced fluid flow in particle separation systems employing standing surface acoustic waves – Part I.},
	journal={Lab on a Chip},
	year={2022}
}
```
## Experimental data

The folder "Experiment" contains the experimentally determined velocity data on the acoustically induced flow in a standing surface acoustic wave field (SAW), which were obtained using Astigmatic Particle Tracking Velocimetry (APTV). For further analysis, the randomly distributed velocity vectors were previously interpolated onto a regular grid. The filenames indicate the respective parameter set of the wavelength of the SAW, channel height and electrical power.

## Numerical data

The numerical results can be found in the "Simulation" folder with the same name coding as the experimental data.

## Matlab scripts

Using the Matlab script "Read_ExpData.m" in the "Scripts" folder, the velocity components (u,v,w) and the spatial coordinates (x,y,z) can be imported as matrices and plotted against the channel cross-section. To visualize the experimental data of another parameter set, the variable filename must be adapted. 

The script "compare_exp_num.m" can be used to quantitatively compare the experimental and numerical data by a 2D cross correlation. The resulting correlation coefficient should be close to 1 to achieve a good agreement between simulation and experiment. To run compare_exp_num.m, the scripts "CrossCorr2D.m" and "finergrid.m" have to be saved in the same folder. 
