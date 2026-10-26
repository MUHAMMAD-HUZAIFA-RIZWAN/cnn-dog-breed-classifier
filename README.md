# CNN Dog Breed Classifier — VGG vs ResNet vs AlexNet

A computer vision project comparing three pretrained CNN architectures — **VGG**, **ResNet**, and **AlexNet** — for dog detection, dog-breed classification, model comparison, and custom-image testing.

This project was completed as part of Udacity's **AI Programming with Python** coursework.

## Project Objectives

The project evaluates four main questions:

1. Can the model correctly distinguish **dogs from non-dogs**?
2. Can the model correctly identify the **breed of dog**?
3. Which CNN architecture performs best overall?
4. Is a faster model a reasonable alternative when runtime matters?

## CNN Architectures Compared

- VGG
- ResNet
- AlexNet

All three models use pretrained ImageNet weights through PyTorch / TorchVision.

## Dataset

The main evaluation dataset contains:

- **40 total images**
- **30 dog images**
- **10 non-dog images**

Ground-truth labels are derived from image filenames.

Example:

```text
Boston_terrier_02259.jpg
        ↓
boston terrier
```

## Workflow

```text
Image Files
   ↓
Create Ground-Truth Labels
   ↓
CNN Classification
   ↓
Compare Predicted vs. True Labels
   ↓
Determine Dog / Non-Dog
   ↓
Calculate Statistics
   ↓
Compare VGG, ResNet, and AlexNet
```

## Final Results

| CNN Model | Dogs Correct | Non-Dogs Correct | Dog Breed Accuracy | Overall Label Match | Runtime* |
|---|---:|---:|---:|---:|---:|
| AlexNet | 100.0% | 100.0% | 80.0% | 75.0% | ~4 s |
| ResNet | 100.0% | 90.0% | 90.0% | 82.5% | ~7 s |
| **VGG** | **100.0%** | **100.0%** | **93.3%** | **87.5%** | ~20 s |

\*Runtime values are from one project-workspace run and can vary by hardware and environment.

### Best Overall Model: VGG

VGG produced the strongest overall performance because it:

- correctly identified all dog images,
- correctly identified all non-dog images,
- achieved the highest dog-breed accuracy (**93.3%**),
- achieved the highest overall label-match rate (**87.5%**).

### Accuracy vs. Runtime

- **VGG** gave the best accuracy, but required the most runtime.
- **ResNet** provided a strong speed/accuracy compromise.
- **AlexNet** was the fastest, but had the lowest dog-breed accuracy.

## Custom Uploaded Image Experiment

The completed classifier was also tested on four custom images:

```text
Dog_01.jpg
Dog_02.jpg
Cat_01.jpg
Coffee_mug_01.jpg
```

`Dog_02.jpg` is a horizontally flipped version of `Dog_01.jpg`.

The dog used in the experiment is a **Labrador Retriever**.

### Custom Image Predictions

| Image | ResNet | AlexNet | VGG |
|---|---|---|---|
| Dog_01.jpg | Bull Mastiff | Golden Retriever | **Labrador Retriever** |
| Dog_02.jpg | Labrador Retriever | Labrador Retriever | **Labrador Retriever** |
| Cat_01.jpg | Red Fox | Hare | **Egyptian Cat / Cat** |
| Coffee_mug_01.jpg | Espresso | Espresso | Espresso |

### Custom Image Findings

- **VGG** was the only model that correctly classified both the original and horizontally flipped dog images as **Labrador Retriever**.
- ResNet and AlexNet changed their breed prediction after the horizontal flip.
- All three models correctly treated the cat and coffee mug as **non-dogs**.
- VGG also correctly recognized the cat as a cat.

This experiment reinforced the conclusion that **VGG was the most accurate and consistent model** for this task.

Detailed observations from the custom-image experiment are available in [`docs/uploaded_image_analysis.txt`](docs/uploaded_image_analysis.txt).

## Project Structure

```text
cnn-dog-breed-classifier/
│
├── README.md
├── LICENSE
├── .gitignore
├── .gitattributes
├── requirements.txt
│
├── check_images.py
├── get_input_args.py
├── get_pet_labels.py
├── classify_images.py
├── adjust_results4_isadog.py
├── calculates_results_stats.py
├── print_results.py
├── classifier.py
├── print_functions_for_lab_checks.py
├── test_classifier.py
│
├── dognames.txt
├── imagenet1000_clsid_to_human.txt
│
├── run_models_batch.sh
├── run_models_batch_uploaded.sh
│
├── pet_images/
├── uploaded_images/
│
├── results/
│   ├── pet_images/
│   │   ├── alexnet_pet-images.txt
│   │   ├── resnet_pet-images.txt
│   │   └── vgg_pet-images.txt
│   └── uploaded_images/
│       ├── alexnet_uploaded-images.txt
│       ├── resnet_uploaded-images.txt
│       └── vgg_uploaded-images.txt
│
└── docs/
    └── uploaded_image_analysis.txt
```

## Core Files

- `check_images.py` — coordinates the complete classification pipeline.
- `get_input_args.py` — handles command-line arguments.
- `get_pet_labels.py` — creates ground-truth labels from filenames.
- `classify_images.py` — runs the CNN classifier and compares labels.
- `adjust_results4_isadog.py` — determines dog/non-dog status.
- `calculates_results_stats.py` — calculates counts and percentages.
- `print_results.py` — prints final summaries and misclassification details.

## Installation

Clone the repository:

```bash
git clone https://github.com/MUHAMMAD-HUZAIFA-RIZWAN/cnn-dog-breed-classifier.git
cd cnn-dog-breed-classifier
```

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

## Running the Project

Run with default settings:

```bash
python check_images.py
```

Defaults:

```text
Image directory: pet_images/
CNN architecture: vgg
Dog names file: dognames.txt
```

Run a specific model:

```bash
python check_images.py --dir pet_images/ --arch resnet --dogfile dognames.txt
```

Available architectures:

```text
resnet
alexnet
vgg
```

## Run All Three Models

```bash
sh run_models_batch.sh
```
> **Windows note:** The `.sh` batch scripts require a Unix-compatible shell such as Git Bash or WSL. They will not run directly in standard PowerShell unless a compatible shell is installed.

Example outputs are stored in:

```text
results/pet_images/
```

## Run the Custom Image Experiment

Place custom images inside:

```text
uploaded_images/
```

Then run:

```bash
sh run_models_batch_uploaded.sh
```

Example outputs are stored in:

```text
results/uploaded_images/
```

## Technologies

- Python
- PyTorch
- TorchVision
- Pillow
- Pretrained CNNs
- ImageNet labels
- `argparse`
- Bash scripting

## Key Learning Outcomes

This project demonstrates:

- working with pretrained CNN architectures,
- image classification using pretrained CNN models,
- Python dictionaries and mutable data structures,
- command-line argument handling,
- file and string processing,
- classification metrics,
- model comparison,
- accuracy-vs-runtime trade-offs,
- model robustness testing using image transformations.

## Educational Project Attribution

This project was completed as part of Udacity's **AI Programming with Python** coursework.

The project framework, dataset structure, pretrained classifier utility, and supporting course materials were provided by Udacity. The completed project work focused on implementing and integrating the required image-label processing, classification comparison, dog/non-dog determination, statistics calculation, results reporting, and model evaluation workflow.

## Image Attribution

The custom test images used for the uploaded-image experiment were sourced from **Unsplash** for educational model evaluation. `Dog_02.jpg` was created by horizontally flipping `Dog_01.jpg`.

## Conclusion

Among the three tested CNN architectures, **VGG achieved the best overall performance**.

It reached:

- **100% dog classification accuracy**
- **100% non-dog classification accuracy**
- **93.3% dog-breed classification accuracy**
- **87.5% overall label-match accuracy**

Although VGG required more runtime than ResNet and AlexNet, its superior accuracy and stronger consistency on the custom-image experiment made it the best model for this classification task.

## License

This repository includes Udacity starter/course material licensed under the MIT License.

See [`LICENSE`](LICENSE) for details.

