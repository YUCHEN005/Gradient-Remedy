# Gradient Remedy for Multi-Task Learning in End-to-End Noise-Robust Speech Recognition

[Gradient Remedy for Multi-Task Learning in End-to-End Noise-Robust Speech Recognition](https://arxiv.org/abs/2302.11362)

## Introduction

Gradient Remedy is a novel method to solve the gradient interference problem in multi-task learning for noise-robust ASR, i.e., conflicting gradients and wrongly dominant gradients.
It has improved the ASR performance on [Robust Automatic Transcription of Speech (RATS)](https://github.com/YUCHEN005/RATS-Channel-A-Speech-Data) and [CHiME-4](https://spandh.dcs.shef.ac.uk/chime_challenge/CHiME4/data.html) datasets.

<div align=center>
<img width=460 src="https://user-images.githubusercontent.com/90536618/196681399-f093065a-3451-4d9d-b950-394c96625f20.png">
</div>

Figure (a): Multi-task learning of speech enhancement (SE) and automatic speech recognition (ASR);

Figure (b): In case the SE and ASR gradients are conflicting (i.e., the angle between them is larger than $90^\circ$), we project the SE gradient onto a dynamic surface at acute angle $\theta$ to ASR gradient, in order to 1) remove conflict and 2) push SE gradient to assist in ASR optimization;

Figure (c): In case of wrongly dominant SE gradient (i.e., $\Vert G_\text{SE} \Vert_2 > K \cdot \Vert G_\text{ASR} \Vert_2$ , where $K>1$ is a threshold), we adaptively rescale the magnitude of two gradients to prevent dominant ASR task being misled by SE gradient.

If you find this work useful in your research, please kindly use the following BibTeX entry for citation:

```bash
@article{hu2023gradient,
  title={Gradient Remedy for Multi-Task Learning in End-to-End Noise-Robust Speech Recognition},
  author={Hu, Yuchen and Chen, Chen and Li, Ruizhe and Zhu, Qiushi and Chng, Eng Siong},
  journal={arXiv preprint arXiv:2302.11362},
  year={2023}
}
```

## Usage

Our code implementation is based on [ESPnet](https://github.com/espnet/espnet) (v.0.9.6), where the experiment folder is `egs2/rats_chA/asr_with_enhancement/`, the network code are at `espnet2/{asr/, enh/, layers/}`, and the optimization code are at `espnet2/train/`.

The core code of Gradient Remedy is at `espnet2/train/trainer_gradient_remedy.py` (line 455-475) [[link]](https://github.com/YUCHEN005/Gradient-Remedy/blob/master/espnet2/train/trainer_gradient_remedy.py#L455)


