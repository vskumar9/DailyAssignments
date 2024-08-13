import matplotlib.pyplot as plt

def simple_bar_chart():
    # Sample data
    categories = ['A', 'B', 'C', 'D']
    values = [3, 7, 5, 4]

    # Create a bar chart
    plt.bar(categories, values)

    # Add title and labels
    plt.title('Simple Bar Chart')
    plt.xlabel('Categories')
    plt.ylabel('Values')

    # Save the plot as a PNG file
    plt.savefig('bar_chart.png')

    # Display the plot
    plt.show()

if __name__ == "__main__":
    simple_bar_chart()
