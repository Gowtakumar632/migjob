# Use the bitnami Spark image as the base
FROM bitnami/spark:latest

# Set up the Ivy cache directory and permissions
RUN mkdir -p /tmp/.ivy2 && chmod -R 777 /tmp/.ivy2

# Optional: Set environment variables for Spark to use the specified Ivy directory
ENV SPARK_LOCAL_DIRS=/tmp
ENV SPARK_JARS_IVY=/tmp/.ivy2

# Copy your application file
COPY app.py /app/app.py

# Set the working directory
WORKDIR /app
EXPOSE 7077
# Set the command to run Spark with the Ivy directory configuration
CMD ["spark-submit", "--master", "spark://spark-master:7077", "--conf", "spark.jars.ivy=/tmp
