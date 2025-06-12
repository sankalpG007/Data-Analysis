import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

def calculate(numbers):
    if len(numbers) != 9:
        raise ValueError("List must contain exactly nine numbers.")

    matrix = np.array(numbers).reshape(3, 3)

    calculations = {
        'Mean': [matrix.mean(axis=0), matrix.mean(axis=1), matrix.mean()],
        'Variance': [matrix.var(axis=0), matrix.var(axis=1), matrix.var()],
        'Std Deviation': [matrix.std(axis=0), matrix.std(axis=1), matrix.std()],
        'Max': [matrix.max(axis=0), matrix.max(axis=1), matrix.max()],
        'Min': [matrix.min(axis=0), matrix.min(axis=1), matrix.min()],
        'Sum': [matrix.sum(axis=0), matrix.sum(axis=1), matrix.sum()],
    }

    # Create a DataFrame for aesthetics
    df = pd.DataFrame({
        'Metric': calculations.keys(),
        'Column-wise': [list(val[0]) for val in calculations.values()],
        'Row-wise': [list(val[1]) for val in calculations.values()],
        'Overall': [round(val[2], 2) for val in calculations.values()]
    })

    return matrix, df

def display_heatmap(matrix):
    plt.figure(figsize=(5, 4))
    sns.heatmap(matrix, annot=True, fmt="d", cmap="YlGnBu", cbar=True, linewidths=0.5, square=True)
    plt.title("3x3 Matrix Heatmap")
    plt.xlabel("Columns")
    plt.ylabel("Rows")
    plt.show()

# ----------- MAIN EXECUTION -----------

# Input
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8]

# Process
matrix, result_df = calculate(numbers)

# Output
print("Input Matrix:")
print(matrix, "\n")
print("Detailed Statistical Summary:\n")
print(result_df.to_string(index=False))

# Visualization
display_heatmap(matrix)
