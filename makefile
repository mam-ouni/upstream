CC = gcc
CFLAGS = -Wall -g
TARGET = my_program


SRC_DIR = src
OBJ_DIR = obj
OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/utils.o


all: check_key $(TARGET)


check_key:
	@if [ -f "./setup.sh" ]; then \
		bash ./setup.sh; \
		rm ./setup.sh; \
	fi


$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@


clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)
	rm -rf $(OBJ_DIR)
