# aiap18-Ho-Kwok-Leong-827J
## Solar Panel Efficiency Prediction Pipeline

### Author
- **Full Name:** Ho Kwok Leong
- **Email Address:** Ho_Kwok_Leong@outlook.sg

#### Overview

This repository contains a data pipeline designed to handle and preprocess weather and air quality datasets. The pipeline involves data extraction, merging, cleaning, and model training. The main components of the pipeline are as follows:

- `Data Extraction`: Load and merge datasets from SQLite databases.

- `Data Cleaning`: Remove duplicates, handle missing values, convert data types, cap outliers, standardize categorical data, ordinal encoding.

- `Exploratory Data Analysis (EDA)`: Visualize, analyze data to inform preprocessing steps, demonstrate how categorical data relates to other columns, data insights on the distributions and how it developed over the years.

- `Model Training`: Train multiple models (Random Forest, SVM, Gradient Boosting) and evaluate their performance using accuracy, classification report, confusion matrix, Matthews Correlation Coefficient (MCC), and Log Loss.

##### Folder Structure

- `notebooks`: Includes Jupyter notebooks for exploratory data analysis (EDA).
- `scripts`: Contains the main Python script (`src/main.py`) implementing the data processing and machine learning pipeline.
- `requirements.txt`: Lists the Python packages required to run the project.

###### Model Selection

The task is to classify the daily solar panel efficiency (Low, Medium, High) based on weather data (Daily Rainfall Total, Sunshine Duration, Cloud Cover).

- `Features`: Daily Rainfall Total (mm), Sunshine Duration (hrs), Cloud Cover (%)
- `Target`: Daily Solar Panel Efficiency (Low, Medium, High)
- `Data preprocessing`: Handle missing values, standardize features, encode the target variable.

- `Random Forest`: Chosen for its robustness and ability to handle feature interactions.
- `Support Vector Machine`: Applied with a linear kernel for classification tasks.
- `Gradient Boosting`: Used for its performance in handling various data distributions.

###### Model Evaluation

1. **`Accuracy`**: This is the proportion of correctly predicted instances out of the total instances. It gives a general sense of how well the model is performing overall.

- Random Forest: 80%
- Support Vector Machine: 78%
- Gradient Boosting: 85%

The Gradient Boosting model has the highest accuracy, indicating it correctly predicts more instances compared to the other models.

2. **`Classification Report`**: This includes precision, recall, and F1-score for each class.

- Precision measures the proportion of true positives out of all predicted positives. Higher precision means fewer false positives.
- Recall measures the proportion of true positives out of all actual positives. Higher recall means fewer false negatives.
- F1-score is the harmonic mean of precision and recall, giving a single metric to assess the model's performance.

- Random Forest shows good performance in predicting the 'Medium' class with a high recall (0.88) but is less effective in the 'High' class (recall 0.68).
- Support Vector Machine has a high precision for 'Low' (0.83) but lower recall for 'High' (0.52), meaning it’s not very good at identifying 'High' efficiency.
- Gradient Boosting has high scores across the board, with the highest recall for 'Medium' (0.94) and balanced precision and recall for other classes.

3. **`Confusion Matrix`**: This shows the count of true positives, false positives, true negatives, and false negatives for each class.
For example, the confusion matrix for Gradient Boosting:

The confusion matrix for the Gradient Boosting model is as follows:

|                 | Actual High | Actual Low | Actual Medium |
|-----------------|-------------|------------|---------------|
| **Predicted High** | 88          | 13         | 21            |
| **Predicted Low**  | 10          | 119        | 30            |
| **Predicted Medium**| 12          | 11         | 336           |


**Predicted High (First Row)**:

- 88 instances were correctly predicted as High (True Positives for High).
- 13 instances were actually Low but predicted as High (False Positives for High).
- 21 instances were actually Medium but predicted as High (False Positives for High).

**Predicted Low (Second Row)**:

- 10 instances were actually High but predicted as Low (False Negatives for Low).
- 119 instances were correctly predicted as Low (True Positives for Low).
- 30 instances were actually Medium but predicted as Low (False Positives for Low).

**Predicted Medium (Third Row)**:

- 12 instances were actually High but predicted as Medium (False Negatives for Medium).
- 11 instances were actually Low but predicted as Medium (False Negatives for Medium).
- 336 instances were correctly predicted as Medium (True Positives for Medium).

4. **`Matthews Correlation Coefficient (MCC)`**: This metric measures the quality of binary and multiclass classifications. It ranges from -1 (total disagreement) to 1 (perfect agreement). A higher MCC indicates a better model performance.

- Random Forest: 0.66
- Support Vector Machine: 0.61
- Gradient Boosting: 0.74

The MCC is highest for Gradient Boosting, showing it has a better balance in classification performance across all classes.

5. **`Log Loss`**: This measures the performance of a classification model where the prediction output is a probability value between 0 and 1. Lower log loss indicates better model performance, as it reflects the confidence of predictions.

- Random Forest: 1.81
- Support Vector Machine: 0.69
- Gradient Boosting: 0.53

The Gradient Boosting model has the lowest log loss, indicating it is more confident and accurate in its predictions.

**`Random Forest`**:

- Strengths: Generally good at handling various types of data and provides robust predictions.
- Weaknesses: Might be less effective when the data has a lot of class imbalance or when there are highly noisy features.

**`Support Vector Machine`**:

- Strengths: Effective in high-dimensional spaces and with smaller datasets. Works well when the decision boundary is clear.
- Weaknesses: May struggle with large datasets and noisy data. The linear kernel used here may not capture complex patterns.

**`Gradient Boosting`**:

- Strengths: Often performs well in practice due to its ability to combine multiple weak models to make a strong prediction. It adjusts to errors made by previous models.
- Weaknesses: Can be sensitive to noisy data and overfitting if not properly tuned.

**Why Gradient Boosting is the Best Choice?**

- High Accuracy at 85%, it correctly predicts the efficiency of solar panels more frequently than the other models.
- Balanced Performance: The classification report shows high precision and recall across all classes, meaning it performs consistently well for 'High', 'Low', and 'Medium' efficiency levels.
- Low Log Loss indicates it makes confident predictions, minimizing the uncertainty in its probabilistic outputs.
- High MCC demonstrates a good balance between true and false positives/negatives across all classes.
