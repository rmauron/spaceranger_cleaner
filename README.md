# Spaceranger cleaner

## Clean spaceranger outputs easily

**Clean spaceranger from normal visium.**

We all know that spaceranger outputs take a lot of space on our servers, usually not knowing what is important to keep or not.

Here, I provide a script that will clean these outputs and keep only what you need, with an option to keep extra files.

Ultimately, it keeps only (default):

```bash
    |-- filtered_feature_bc_matrix.h5
    |-- raw_feature_bc_matrix.h5
    |-- spatial
    |   |-- aligned_fiducials.jpg
    |   |-- detected_tissue_image.jpg
    |   |-- scalefactors_json.json
    |   |-- spatial_enrichment.csv
    |   |-- tissue_hires_image.png
    |   |-- tissue_lowres_image.png
    |   `-- tissue_positions.csv
    `-- web_summary.html
```

## Use `spaceranger_cleaner.sh`

```bash
<PATH/TO/SCRIPT/spaceranger_cleaner.sh> [OPTIONS] <PATH/TO/SPACERANGER/OUTPUTS/TO/CLEAN>
```

### OPTION, keep extra files:

`-k` or `--keep` <FILE_NAME_TO_KEEP>

In some case, you need to keep extra files like cloupe.cloupe.

```bash
<PATH/TO/SCRIPT/spaceranger_cleaner.sh> -k cloupe.cloupe <PATH/TO/SPACERANGER/OUTPUTS/TO/CLEAN>
```

## Clean as many spaceranger outputs as you want:

**Default run:**

```bash
<PATH/TO/SCRIPT/spaceranger_cleaner.sh> SAMPLE1 SAMPLE2 SAMPLE3
```

**Outputs:**

```bash
`SAMPLE1
    |-- filtered_feature_bc_matrix.h5
    |-- raw_feature_bc_matrix.h5
    |-- spatial
    |   |-- aligned_fiducials.jpg
    |   |-- detected_tissue_image.jpg
    |   |-- scalefactors_json.json
    |   |-- spatial_enrichment.csv
    |   |-- tissue_hires_image.png
    |   |-- tissue_lowres_image.png
    |   `-- tissue_positions.csv
    `-- web_summary.html
`SAMPLE2
    |-- filtered_feature_bc_matrix.h5
    |-- raw_feature_bc_matrix.h5
    |-- spatial
    |   |-- aligned_fiducials.jpg
    |   |-- detected_tissue_image.jpg
    |   |-- scalefactors_json.json
    |   |-- spatial_enrichment.csv
    |   |-- tissue_hires_image.png
    |   |-- tissue_lowres_image.png
    |   `-- tissue_positions.csv
    `-- web_summary.html
`SAMPLE3
    |-- filtered_feature_bc_matrix.h5
    |-- raw_feature_bc_matrix.h5
    |-- spatial
    |   |-- aligned_fiducials.jpg
    |   |-- detected_tissue_image.jpg
    |   |-- scalefactors_json.json
    |   |-- spatial_enrichment.csv
    |   |-- tissue_hires_image.png
    |   |-- tissue_lowres_image.png
    |   `-- tissue_positions.csv
    `-- web_summary.html
```

**Option run:**

```bash
<PATH/TO/SCRIPT/spaceranger_cleaner.sh> -k cloupe.cloupe SAMPLE1
```

**Outputs:**

```bash
`SAMPLE1
    |-- cloupe.cloupe
    |-- filtered_feature_bc_matrix.h5
    |-- raw_feature_bc_matrix.h5
    |-- spatial
    |   |-- aligned_fiducials.jpg
    |   |-- detected_tissue_image.jpg
    |   |-- scalefactors_json.json
    |   |-- spatial_enrichment.csv
    |   |-- tissue_hires_image.png
    |   |-- tissue_lowres_image.png
    |   `-- tissue_positions.csv
    `-- web_summary.html
```

## Free up disk space

This saves a considerable amount of space.

Other files can be regenerated from fastq files in case you or a collaborator needs something extra afterwards.
