// Sort.es6.jsx
class SortItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { direction: '' };
  }
  handleClick(prevState) {
    if (prevState === '') {
      this.setState({ direction: 'desc' })
    } else if (prevState === 'desc' ) {
      this.setState({ direction: 'asc' })
    } else if (prevState === 'asc' ) {
      this.setState({ direction: '' })
    }
  }
  render() {
    let icon;
    if ( this.state.direction === '' ) {
      icon = 
      <span className= 'btn btn-sm btn-sort' onClick={ () => this.handleClick(this.state.direction) }>NONE</span>;
    } else if ( this.state.direction === 'desc' ) {
      icon =
      <span className= 'btn btn-sm btn-sort' onClick={ () => this.handleClick(this.state.direction) }>DESC</span>;
    } else {
      icon =
      <span className= 'btn btn-sm btn-sort' onClick={ () => this.handleClick(this.state.direction) }>ASC</span>;
    }
    return (
      <li dir={this.state.direction} id={this.props.sortName}>
        { this.props.sortName }
        { icon }
      </li>
    );
  }
}


class Sort extends React.Component {
  render () {
    return (
      <ul className='sort-items'>
        <SortItem sortName='name'/>
        <SortItem sortName='cooking time'/>
      </ul>
    );
  }
}


Sort.propTypes = {
  difficulty: React.PropTypes.string
};
