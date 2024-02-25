package database;

import java.util.ArrayList;

import model.User;

public interface InterfaceDAO<T> {
	public ArrayList<T> selectAll();

	public T selectById(T t);

	public int insert(T t);

	public int insertAll(ArrayList<T> arr);

	public int delete(T t);

	public int deleteAll(ArrayList<T> arr);

	int update(User t);

}
