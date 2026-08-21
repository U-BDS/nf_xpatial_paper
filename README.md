# nf_xpatial manuscript

This repository contains the analytical code implemented for the demostration and benchmark of the [`nf_xpatial`](https://github.com/U-BDS/nf_xpatial) pipeline.

## Datasets

The data implemented for the demostration and computational benchmark were derived from the following sources:

1. **In house Xenium mouse brain dataset:**

	* 347-gene probe set (10x Genomics Mouse Brain Panel and 100 custom genes)
    * Four coronal hemisections (one per animal) 
	* Data has been deposited in GEO under the following accession number: `GSE342202`
    * Scope of data in the manuscript: Workflow demostration and computational benchmark

2. **Bilous et al.** Six FFPE non-small-cell lung cancer samples from the work cited below:

	* Xenium Prime 5K data
	* GEO record: `GSE311609` with sample IDs: `GSM9509134`, `GSM9509135`, `GSM9509136`, `GSM9509137`, `GSM9509138`, and `GSM9509139`
    * Scope of data in the manuscript: Computational benchmark

    Citation:
    

	
	>Bilous, M., Buszta, D., Bac, J. et al. Resolving sensitivity, specificity and signal contamination in Xenium spatial transcriptomics. Nat Methods 23, 1152–1162 (2026). https://doi.org/10.1038/s41592-026-03089-8

## Docker Image

The Docker image containing the software dependencies for the figures shown in the manuscript is available at: <https://hub.docker.com/r/uabbds/nf_xenium_analysis>. v0.0.5 was used for the figure generation. The Docker image was converted to a Singularity image with processing performed at the UAB High Performance Computing cluster.

## Citation

If you use nf_xpatial, please cite our work as:

>TODO

### Primary workflow developers
- Luke Potter
- Austyn Trull
- Nilesh Kumar
- Lara Ianov

### Support

We would also like to thank the following people and groups for their support, including financial support:

- Elizabeth Worthey
- Jeremy Day
- Jamie Peters
- Jasper Heinsbroek
- Funding: 
   - Health Services Foundation’s General Endowment Fund
   - University of Alabama at Birmingham Biological Data Science Core (U-BDS), RRID:SCR_021766, <https://github.com/U-BDS>
   - Civitan International Research Center
   - UAB Office of Research
   - 3P30CA013148-48S8
   - UAB MPI Award (Jeremy Day, Jamie Peters, Jasper Heinsbroek)
   - UM1TR004771
   - UAB MULTIPI8110 and Dr. Worthey's start-up funds

