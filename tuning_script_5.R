FLAGS= flags(
  flag_numeric("learning_rate", 0.01),
  flag_numeric("units1", 32),
  flag_numeric('units2', 16),
  flag_numeric('units3', 8),
  flag_numeric("batch_size", 32),
  flag_numeric("dropout", 0.2)
)

model2 <- keras_model_sequential() %>%
  layer_dense(units = FLAGS$units1, activation = "relu",
              input_shape = dim(train_encoded[])[2]) %>%
  layer_dropout(FLAGS$dropout)%>%
  layer_dense(units = FLAGS$units2, activation = "relu") %>%
  layer_dropout(FLAGS$dropout)%>%
  layer_dense(units = FLAGS$units3, activation = "relu") %>%
  layer_dropout(FLAGS$dropout)%>%
  layer_dense(units = 1, activation = "sigmoid")


opt= optimizer_adam(learning_rate= FLAGS$learning_rate)
model2 %>% compile(
  loss = "binary_crossentropy",
  optimizer = opt )


history <- model %>% fit(as.matrix(train_encoded), training_labels,
                         epochs = 20,
                         batch_size = 20, verbose=2,
                         validation_data = list(as.matrix(val_encoded), validation_labels)
)
