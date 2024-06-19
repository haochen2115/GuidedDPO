# Incorporating Hints to Guide LLM Training for Mathematical Problem Solving

## Abstract
Mathematical problems remain challenging for large models, and algorithms such as PPO and DPO have low efficiency in exploring mathematical solution strategies. To tackle this issue, we propose a hint-based training method, enabling the model to identify errors from the standard answers and provide itself with hints, thereby generating correct answers. Experimental data shows that the model often needs only a few hints to identify its mistakes and regenerate correct answers. We trained the model using the hint-corrected answers, and the results were significantly better than training the model directly using standard answers.

![# GuidedDPO](guided.jpg)

## Motivation
In solving mathematical problems, finding the correct problem-solving approach is particularly crucial. If the wrong method is chosen, it is difficult to arrive at the answer even with infinite exploration. However, large models often require just a simple hint to find the correct solution path.


## This Repository:
- Proposes a hint-based training method for large models to help them find mathematical problem-solving approaches 
- Demonstrates that the model can find the correct solution path through its own hints
- Validates through experiments that the hint-generated answers serve as better training data for the model

## Experiment Run Script:
```bash
sh guided_dpo.sh
```

## Preview of experimental results:

|Method|Data|Acc|
|--|--|--|
|SFT|query, standard_answer|x%|
|SFT|query, hint_answer|x%|
|DPO|query, standard_answer, wrong_answer|x%|
|DPO|query, hint_answer, wrong_answer|x%|
|DPO|query, standard_answer, wrong_answer, hint_answer|x%|

