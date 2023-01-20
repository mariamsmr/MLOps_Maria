M27 DISTRIBUTED DATA LOADING
-----------------------------------------------------------------

how do load data in parallel to make sure that we always have data ready for our compute devices.
It is important to understand the physical layout of a standard CPU.
In a Python terminal you should be able to get the number of cores in your machine by writing:

import multiprocessing
cores = multiprocessing.cpu_count()
print(f"Number of cores: {cores}, Number of threads: {2*cores}")

to construct a data pipeline:
1. Download the dataset and extract to a folder. 
2. Fill out the lfw_dataset.py file
3. Run it: python lfw_dataset.py
4. Visualize a single batch:  python lfw_dataset.py -visualize_batch
5. How the number of workers influences the performance: python lfw_dataset.py -get_timing -num_workers 1
6. Retry the experiment using more complex data augmentation


M28 DISTRIBUTED TRAINING
-----------------------------------------------------------------

Distributed training is one of the key ingredients to all the awesome results that deep learning models are producing.

* Data parallel (DP) training

In Pytorch we can very simply enable data parallel training by wrapping our model in the nn.DataParallel class:

from torch import nn
model = MyModelClass()
model = nn.DataParallel(model, device_ids=[0, 1])  # data parallel on gpu 0 and 1
preds = model(input)  # same as usual



* Distributed data parallel (DDP) training
The main problem is that it requires a large transfer of data as the model needs to replicated on each pass.



M29 SCALABLE INFERENCE
-----------------------------------------------------------------

Inference is task of applying our trained model to some new and unseen data, often called prediction.

*CHOOSING THE RIGHT ARCHITECTURE:

As dissed in this blogpost the largest increase in inference speed you will see (given some speficic hardware) is choosing an efficient model architechture. 

FLOP (floating point operation) which is any mathematical operation (such as +, -, *, /) or assignment that involves floating-point numbers:

$ pip install ptflops


*QUANTIFICATION:

Quantization is a technique where all computations are performed with integers instead of floats. 
We are essentially taking all continuous signals and converting them into discretized signals.

1. Start by creating a tensor that contains both random numbers
2. Next call the torch.quantize_per_tensor function on the tensor.
3. Finally, try to call the .dequantize() method on the tensor. 

*PRUNING:

Pruning is another way for reducing the model size and maybe improve performance of our network. 
Try to prune the weights of the first convolutional layer by calling:

prune.random_unstructured(module_1, name="weight", amount=0.3)

Instead of pruning only a single module in the model lets try pruning the hole model:
for name, module in new_model.named_modules():
   prune.l1_unstructured(module, name='weight', amount=0.2)

*KNOWLEDGE DISTILLATION

Knowledge distillation is somewhat similar to pruning, in the sense that it tries to find a smaller model that can perform equally well as a large model, however it does so in a completly different way.

$ pip install transformers
$ pip install datasets

1. Next download the cifar10 dataset

from datasets import load_dataset
dataset = load_dataset("cifar10")

2. Next lets initialize our teacher model
from transformers import AutoFeatureExtractor, AutoModelForImageClassification
extractor = AutoFeatureExtractor.from_pretrained("aaraki/vit-base-patch16-224-in21k-finetuned-cifar10")
model = AutoModelForImageClassification.from_pretrained("aaraki/vit-base-patch16-224-in21k-finetuned-cifar10")

3. Implement a simple convolutional model. 
4. Train the model on cifar10 to convergence
5. Compare the final performance obtained




