# app.py

from pyspark.sql import SparkSession

def main():
    spark = SparkSession.builder \
        .appName("PySpark Docker Cluster Example") \
        .getOrCreate()

    # Example DataFrame
    data = [("Alice", 1), ("Bob", 2), ("Cathy", 3)]
    columns = ["Name", "Id"]

    df = spark.createDataFrame(data, columns)
    df.show()

    spark.stop()

if __name__ == "__main__":
    main()
