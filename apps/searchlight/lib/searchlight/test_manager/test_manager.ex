defmodule Searchlight.TestManager do
  @moduledoc """
  The TestManager context.
  """

  import Ecto.Query, warn: false
  alias Searchlight.Repo

  alias Searchlight.TestManager.TestType

  @doc """
  Returns the list of test_types.

  ## Examples

      iex> list_test_types()
      [%TestType{}, ...]

  """
  def list_test_types do
    Repo.all(TestType)
  end

  @doc """
  Gets a single test_type.

  Raises `Ecto.NoResultsError` if the Test type does not exist.

  ## Examples

      iex> get_test_type!(123)
      %TestType{}

      iex> get_test_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test_type!(id), do: Repo.get!(TestType, id)

  @doc """
  Creates a test_type.

  ## Examples

      iex> create_test_type(%{field: value})
      {:ok, %TestType{}}

      iex> create_test_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test_type(attrs \\ %{}) do
    %TestType{}
    |> TestType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test_type.

  ## Examples

      iex> update_test_type(test_type, %{field: new_value})
      {:ok, %TestType{}}

      iex> update_test_type(test_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test_type(%TestType{} = test_type, attrs) do
    test_type
    |> TestType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TestType.

  ## Examples

      iex> delete_test_type(test_type)
      {:ok, %TestType{}}

      iex> delete_test_type(test_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test_type(%TestType{} = test_type) do
    Repo.delete(test_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test_type changes.

  ## Examples

      iex> change_test_type(test_type)
      %Ecto.Changeset{source: %TestType{}}

  """
  def change_test_type(%TestType{} = test_type) do
    TestType.changeset(test_type, %{})
  end

  alias Searchlight.TestManager.Test

  @doc """
  Returns the list of tests.

  ## Examples

      iex> list_tests()
      [%Test{}, ...]

  """
  def list_tests do
    Repo.all(Test)
  end

  @doc """
  Gets a single test.

  Raises `Ecto.NoResultsError` if the Test does not exist.

  ## Examples

      iex> get_test!(123)
      %Test{}

      iex> get_test!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test!(id), do: Repo.get!(Test, id)

  @doc """
  Creates a test.

  ## Examples

      iex> create_test(%{field: value})
      {:ok, %Test{}}

      iex> create_test(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test(attrs \\ %{}) do
    %Test{}
    |> Test.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test.

  ## Examples

      iex> update_test(test, %{field: new_value})
      {:ok, %Test{}}

      iex> update_test(test, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test(%Test{} = test, attrs) do
    test
    |> Test.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Test.

  ## Examples

      iex> delete_test(test)
      {:ok, %Test{}}

      iex> delete_test(test)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test(%Test{} = test) do
    Repo.delete(test)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test changes.

  ## Examples

      iex> change_test(test)
      %Ecto.Changeset{source: %Test{}}

  """
  def change_test(%Test{} = test) do
    Test.changeset(test, %{})
  end
end
