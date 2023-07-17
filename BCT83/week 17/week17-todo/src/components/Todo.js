import React,{useState, useRef, useEffect} from 'react'
import './Todo.css';
import {AiFillCheckSquare} from "react-icons/ai";
import {AiFillEdit} from "react-icons/ai";
import {AiFillDelete} from "react-icons/ai";

function Todo() {
    const [todo, setTodo] = useState("")
    const [todos,setTodos] = useState([])
    const [editId,setEditId] = useState(0)

    const addTodo = () => {
        if(todo !== '') {
            setTodos([...todos,{list: todo, id: Date.now(), status:false}]) 
            setTodo('')
        } 
        const isTodoDuplicate = todos.some((existingTodo) => existingTodo.list === todo);
        if (isTodoDuplicate) {
            alert('This task is already exists!');
            return;
        }
        if(editId){
            const editTodo = todos.find((todo)=>todo.id === editId)
            const updateTodo = todos.map((to)=>to.id === editTodo.id
            ? (to = {id: to.id, list:todo})
            : (to = {id : to.id , list:to.list}))
            setTodos(updateTodo)
            setEditId(0)
            setTodo()
        }
    };

    const handleSubmit = (e) => {
        e.preventDefault()
    };

    const inputRef = useRef('null')

    useEffect(()=>{
        inputRef.current.focus();
    });

    const onDelete = (id) => {
       setTodos( todos.filter((to) =>to.id !== id))
    };

    const onComplete = (id) =>{
        let complete = todos.map((list)=>{
            if(list.id === id){
            return ({...list, status : !list.status })
            }
            return list;
        })
        setTodos(complete)
    };

    const onEdit = (id)=> {
        const editTodo =todos.find((to)=> to.id===id)
        setTodo(editTodo.list)
        setEditId(editTodo.id)
    };
    const deleteAllTodos = () => {
        setTodos([]);
      };

  return (
    <div className='container'>
      <h2>TODO APP</h2>
      <form className='form-group' onSubmit={handleSubmit}>
        <input type="text" value={todo} ref={inputRef} placeholder="Enter your task" className='form-control' onChange={(event)=>setTodo(event.target.value)}/>
        <button onClick={addTodo}>{editId ? 'EDIT' :'ADD'}</button>
      </form>
      
      <div className="list">
        <ul>
            {
            todos.map((to)=> (
                <li className="list-items">
                    <div classNme="list-item-list" id={to.status? 'list-item' :''}>{to.list}</div>
                    <span>
                        <AiFillCheckSquare className="list-item-icons" id='complete' title="Complete"
                        onClick= {()=>onComplete(to.id)}
                        />
                        <AiFillEdit className="list-item-icons" id='edit' title="Edit"
                        onClick={()=>onEdit(to.id)}
                        />
                        <AiFillDelete className="list-item-icons" id='delete' title="Delete"
                        onClick={()=>onDelete(to.id)}
                        />
                    </span>
                </li>
                ))
            }
        </ul>
        <button onClick={deleteAllTodos}>Delete All</button>

      </div>
    </div>
  )
}

export default Todo
